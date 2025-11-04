using System;
using System.Collections.Generic;
using System.Diagnostics;

class TestRunner
{
    static void Main()
    {
        var tests = new List<Action> {
            TestSmallExample,
            TestDuplicateValues,
            TestPerformance
        };

        int passed = 0;
        foreach (var t in tests)
        {
            try
            {
                t();
                Console.WriteLine($"{t.Method.Name}: PASS");
                passed++;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{t.Method.Name}: FAIL -> {ex.Message}");
            }
        }

        Console.WriteLine($"{passed}/{tests.Count} tests passed.");
    }

    static void AssertEqual(IList<int> a, IList<int> b)
    {
        if (a.Count != b.Count) throw new Exception("Length mismatch");
        for (int i = 0; i < a.Count; i++) if (a[i] != b[i]) throw new Exception($"Mismatch at {i}: {a[i]} != {b[i]}");
    }

    static void TestSmallExample()
    {
        int n = 3;
        var lines = new List<int>{1,2,3};
        int m = 4;

        var res1 = DynamicSearch.FindLines(n, lines, m);
        var res2 = DynamicSearchRunner.FindLinesII(n, lines, m);

        AssertEqual(res1, res2);
    }

    static void TestDuplicateValues()
    {
        // multiple lines with same initial sizes
        int n = 4;
        var lines = new List<int>{0,0,0,0};
        int m = 3;

        var res1 = DynamicSearch.FindLines(n, lines, m);
        var res2 = DynamicSearchRunner.FindLinesII(n, lines, m);

        AssertEqual(res1, res2);
    }

    static void TestPerformance()
    {
        int n = 10000;
        var rand = new Random(123);
        var lines = new List<int>(n);
        for (int i = 0; i < n; i++) lines.Add(rand.Next(0, 1000));
        int m = 50000;

        var sw = Stopwatch.StartNew();
        var r1 = DynamicSearch.FindLines(n, lines, m);
        sw.Stop();
        Console.WriteLine($"FindLines (SortedSet) time: {sw.ElapsedMilliseconds} ms");

        sw.Restart();
        var r2 = DynamicSearchRunner.FindLinesII(n, lines, m);
        sw.Stop();
        Console.WriteLine($"FindLinesII (heapify + heap) time: {sw.ElapsedMilliseconds} ms");

        AssertEqual(r1, r2);
    }
}
