// The Problem
// There are n lines of people waiting for food, and the number of people waiting in each line is known. Then, each of m new people will arrive, and they
// will join the shortest line (the line with the fewest number of people). Our
// task is to determine the number of people in each line that each of the m
// people joins.

using System;
using System.Linq;
using System.Collections.Generic;


public class DynamicSearch
{
    public static List<int> FindLines(int n, List<int> lines, int m)
    {
        // Initialize a min-heap (priority queue) to keep track of the lines
        var minHeap = new SortedSet<(int people, int index)>();
        for (int i = 0; i < n; i++)
        {
            minHeap.Add((lines[i], i));
        }

        // Process each of the m new people
        for (int i = 0; i < m; i++)
        {
            // Get the line with the fewest people
            var (people, index) = minHeap.Min;
            minHeap.Remove(minHeap.Min);

            // The new person joins this line
            people += 1;

            // Update the line in the min-heap
            minHeap.Add((people, index));
        }

        // Prepare the result array
        var result = new int[n];
        foreach (var (people, index) in minHeap)
        {
            result[index] = people;
        }

        return result.ToList();
    }
}

public static class DynamicSearchRunner
{
    // New FindLinesII that uses MinPriorityQueue with O(n) heapify + O(m log n) updates
    public static List<int> FindLinesII(int n, List<int> lines, int m)
    {
        // Build initial items
        var items = new List<KeyValuePair<int, int>>(n);
        for (int i = 0; i < n; i++) items.Add(new KeyValuePair<int, int>(lines[i], i));

        var heap = new DynamicSearchII.MinPriorityQueue<int, int>(items);

        for (int i = 0; i < m; i++)
        {
            var top = heap.Peek(); // (people, index)
            int people = top.key;
            int index = top.value;

            // increment people for that line
            heap.TryUpdateKey(index, people + 1);
        }

        // collect results
        var result = new int[n];
        foreach (var pair in heap.ToList())
        {
            result[pair.value] = pair.key;
        }

        return result.ToList();
    }
}

public class DynamicSearchII
{
    public class MinPriorityQueue<TKey, TValue>
    {
        // Binary min-heap stored as an array (List). Each entry stores a key and the associated value.
        // For update-by-value operations we keep a dictionary mapping TValue -> set of indices in the heap.
        // This allows duplicate TValue entries. Each TValue maps to a HashSet<int> of positions.
        private readonly List<(TKey key, TValue value)> _heap = new();
        private readonly Dictionary<TValue, HashSet<int>> _positions = new();
        private readonly IComparer<TKey> _keyComparer;

        public MinPriorityQueue(IComparer<TKey> keyComparer = null)
        {
            _keyComparer = keyComparer ?? Comparer<TKey>.Default;
        }

        // Construct from an initial set of key/value pairs and heapify in O(n).
        public MinPriorityQueue(IEnumerable<KeyValuePair<TKey, TValue>> items, IComparer<TKey> keyComparer = null)
            : this(keyComparer)
        {
            if (items == null) return;

            foreach (var kv in items)
            {
                _heap.Add((kv.Key, kv.Value));
            }

            // populate positions (if duplicate TValue occur, last occurrence wins)
            for (int i = 0; i < _heap.Count; i++)
            {
                var v = _heap[i].value;
                if (!_positions.TryGetValue(v, out var set))
                {
                    set = new HashSet<int>();
                    _positions[v] = set;
                }
                set.Add(i);
            }

            Heapify();
        }

        public int Count => _heap.Count;

        public bool IsEmpty => _heap.Count == 0;

        private static int Parent(int i) => (i - 1) / 2;
        private static int Left(int i) => 2 * i + 1;
        private static int Right(int i) => 2 * i + 2;

        private void Heapify()
        {
            for (int i = Parent(_heap.Count - 1); i >= 0; i--)
                SiftDown(i);
        }

        public void Enqueue(TKey key, TValue value)
        {
            int idx = _heap.Count;
            _heap.Add((key, value));
            if (!_positions.TryGetValue(value, out var set))
            {
                set = new HashSet<int>();
                _positions[value] = set;
            }
            set.Add(idx);
            SiftUp(idx);
        }

        public (TKey key, TValue value) Peek()
        {
            if (_heap.Count == 0) throw new InvalidOperationException("The priority queue is empty.");
            return _heap[0];
        }

        public bool TryDequeue(out TKey key, out TValue value)
        {
            if (_heap.Count == 0)
            {
                key = default;
                value = default;
                return false;
            }

            var root = _heap[0];
            key = root.key;
            value = root.value;
            RemoveAt(0);
            return true;
        }

        // Try to update the key for an existing value. Returns false if the value was not found.
        public bool TryUpdateKey(TValue value, TKey newKey)
        {
            if (!_positions.TryGetValue(value, out var set) || set.Count == 0) return false;

            // pick any index for this value (first)
            int idx = -1;
            foreach (var vIdx in set) { idx = vIdx; break; }
            if (idx < 0) return false;

            var oldKey = _heap[idx].key;
            _heap[idx] = (newKey, value);

            if (_keyComparer.Compare(newKey, oldKey) < 0)
                SiftUp(idx);
            else
                SiftDown(idx);

            return true;
        }

        private void RemoveAt(int idx)
        {
            int last = _heap.Count - 1;
            var removed = _heap[idx];
            // remove this index from the positions set
            if (_positions.TryGetValue(removed.value, out var remSet))
            {
                remSet.Remove(idx);
                if (remSet.Count == 0) _positions.Remove(removed.value);
            }

            if (idx == last)
            {
                _heap.RemoveAt(last);
                return;
            }

            var lastNode = _heap[last];
            _heap[idx] = lastNode;
            // update positions: remove last index and add idx
            if (_positions.TryGetValue(lastNode.value, out var lastSet))
            {
                lastSet.Remove(last);
                lastSet.Add(idx);
            }
            _heap.RemoveAt(last);

            // After replacement, try to restore heap property.
            if (!SiftDown(idx))
                SiftUp(idx);
        }

        private void SiftUp(int i)
        {
            while (i > 0)
            {
                int p = Parent(i);
                if (_keyComparer.Compare(_heap[i].key, _heap[p].key) < 0)
                {
                    Swap(i, p);
                    i = p;
                }
                else break;
            }
        }

        // Returns true if element moved
        private bool SiftDown(int i)
        {
            int n = _heap.Count;
            int start = i;
            while (true)
            {
                int l = Left(i);
                int r = Right(i);
                int smallest = i;
                if (l < n && _keyComparer.Compare(_heap[l].key, _heap[smallest].key) < 0) smallest = l;
                if (r < n && _keyComparer.Compare(_heap[r].key, _heap[smallest].key) < 0) smallest = r;
                if (smallest == i) break;
                Swap(i, smallest);
                i = smallest;
            }
            return i != start;
        }

        private void Swap(int i, int j)
        {
            var tmp = _heap[i];
            _heap[i] = _heap[j];
            _heap[j] = tmp;

            // update position sets for swapped values
            var vi = _heap[i].value;
            var vj = _heap[j].value;

            if (_positions.TryGetValue(vi, out var setI))
            {
                setI.Remove(j);
                setI.Add(i);
            }
            else
            {
                _positions[vi] = new HashSet<int> { i };
            }

            if (_positions.TryGetValue(vj, out var setJ))
            {
                setJ.Remove(i);
                setJ.Add(j);
            }
            else
            {
                _positions[vj] = new HashSet<int> { j };
            }
        }

        // Optional helpers
        public bool ContainsValue(TValue value) => _positions.ContainsKey(value);

        public IReadOnlyList<(TKey key, TValue value)> ToList() => _heap.AsReadOnly();
    }
}