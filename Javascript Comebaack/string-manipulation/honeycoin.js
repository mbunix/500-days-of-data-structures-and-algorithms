const express = require("express");
const app = express();
const bodyParser = require("body-parser");
app.use(bodyParser.json());

// Joi v17
const Joi = require("@hapi/joi");

// Validation schema
const schema = Joi.object({
    fullName: Joi.string()
        .max(128)
    // allow Unicode letters, spaces, periods, hyphens and apostrophes
    // do not allow the name to start or end with period, hyphen or apostrophe
    .pattern(/^(?![.\-'])(?!.*[.\-']$)[\p{L} .'\-]+$/u)
        .required()
        .messages({
            'string.base': '"fullName" must be a string',
            'string.empty': '"fullName" is required',
            'any.required': '"fullName" is required',
            'string.max': '"fullName" length must be less than or equal to 128 characters long',
            'string.pattern.base': '"fullName" must contain only letters, spaces, periods, hyphens or apostrophes and cannot start or end with a period, hyphen or apostrophe'
        }),

    email: Joi.string()
        .email({ tlds: { allow: false } })
        .required()
        .messages({
            'string.base': '"email" must be a string',
            'string.empty': '"email" is required',
            'any.required': '"email" is required',
            'string.email': '"email" must be a valid email'
        }),

    age: Joi.number()
        .integer()
        .min(18)
        .max(100)
        .required()
        .messages({
            'number.base': '"age" must be a number',
            'number.integer': '"age" must be an integer',
            'any.required': '"age" is required',
            'number.min': '"age" must be larger than or equal to 18',
            'number.max': '"age" must be less than or equal to 100'
        }),

    title: Joi.string()
        .valid('Mr.', 'Mrs.', 'Ms.', 'N/A')
        .optional()
        .messages({ 'any.only': '"title" must be one of [Mr., Mrs., Ms., N/A]' }),

    password: Joi.string().min(1).optional().messages({ 'string.base': '"password" must be a string', 'string.min': '"password" must be a non-empty string' }),
    token: Joi.string().min(1).optional().messages({ 'string.base': '"token" must be a string', 'string.min': '"token" must be a non-empty string' }),

    registrationTimestamp: Joi.string()
        .optional()
        .custom((value, helpers) => {
            const t = Date.parse(value);
            if (isNaN(t)) return helpers.error('any.invalid');
            return value;
        })
        .messages({ 'any.invalid': '"registrationTimestamp" must be a valid date', 'string.base': '"registrationTimestamp" must be a string' })
})
    // Exactly one of password or token must be present. Provide clear messages for both failure modes.
    .xor('password', 'token')
    .messages({
        'object.missing': 'either password or token must be present',
        'object.xor': 'only one of password or token must be present'
    })
    .options({ abortEarly: false, allowUnknown: true, stripUnknown: true });

// Helper to format Joi errors
function formatJoiErrors(error) {
    const errs = [];
    if (!error || !error.details) return errs;
    for (const d of error.details) {
        // Tests expect an array of error objects containing at least the message.
        errs.push({ message: d.message });
    }
    return errs;
}

app.post('/users', (req, res) => {
    try {
        const payload = req.body || {};

        // first perform Joi validation for types and formats
        const { error, value } = schema.validate(payload);

        // collect errors
        const errors = formatJoiErrors(error);

        if (errors.length > 0) {
            return res.status(422).json({ statusCode: 422, errors });
        }

        // success: per requirements return 201 with no payload
        return res.sendStatus(201);
    } catch (err) {
        // Unexpected error — log and return 500 for diagnosability in CI.
        // However, we keep the app from crashing.
        // eslint-disable-next-line no-console
        console.error(err && err.stack ? err.stack : err);
        return res.sendStatus(500);
    }
});
app.all("*", (req, res) => {
    // console.log('this is a debug message');
    return res.sendStatus(500);
});
// Export the express app (so it can be used by tests or a server runner)
module.exports = app;