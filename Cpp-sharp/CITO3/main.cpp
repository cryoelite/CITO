#include <vector>
#include <string>
#include <iostream>
#include <algorithm>
#include <utility>
using namespace std;

class Solution {
public:
    // https://visualgo.net/en/sorting?slide=1 for visualizations
    // https://www.programiz.com/dsa/sorting-algorithm for reference
    vector<int> &bubbleSort(vector<int> &nums) {
        // the sort is 'bubbled up', i.e., 2 adjacent elements are compared and swapped if unsorted,
        // and this is done for entire array, and as many times as it takes to sort the whole array,
        // at worst n times. The alg looks like it bubbles the sorts up, like carrying the biggest
        // element to the end at each sort.
        for (int n{static_cast<int>(nums.size() - 1)}, swaps{0}; n >= 0; --n, swaps = 0) {
            for (size_t i{0}; i < nums.size() - 1; ++i) {
                if (nums[i] > nums[i + 1]) {
                    swap(nums[i], nums[i + 1]);
                    ++swaps;
                }
            }
            if (!swaps) {
                break; // if the array is sorted early, break
            }
        }
        return nums;
    }

    vector<int> &insertionSort(vector<int> &nums) {
        // As the name implies, insertion sort just takes each element and then 'inserts' it in the
        // correct position in a sorted array.
        //  For this, we can use 2 arrays, or we can use the source array itself.
        // In the latter case, we 'insert' the element from the left side of the array making the
        // left side sorted, and we bring 1 element from the right at each iteration.

        for (size_t i{1}; i < nums.size(); ++i) {
            int cur{nums[i]};
            int j{static_cast<int>(i - 1)};
            for (; j >= 0 && nums[j] > cur; --j) {
                nums[j + 1] = nums[j];
            }

            nums[j + 1] = cur;
        }
        return nums;
    }

    vector<int> &selectionSort(vector<int> &nums) {
        // Selection sort is very simple, in that, it selects the min. element from the entire
        // array in each iteration, and then swaps it from an increasing position in the left
        for (size_t i{0}; i < nums.size(); ++i) {
            size_t min_index{
                i
            }; // we initialize the min index with the start elem of each iteration
            for (size_t j{i}; j < nums.size(); ++j) {
                if (nums[j] < nums[min_index]) {
                    min_index = j;
                }
            }
            swap(nums[i], nums[min_index]);
        }
        return nums;
    }

    vector<int> &countingSort(vector<int> &nums) {
        // The logic for counting sort is very simple. We simply store the counts of elements in
        // a separate array, where the index represents an element in array, then we simply
        // iterate over the count array and fill the original array back.
        // https://www.interviewcake.com/concept/java/counting-sort
        // Generally only works with +ves, if any elem is -ve I've made it to exit.

        int max_elem{nums[0]}; // calculating the size of the count array
        for (size_t i{0}; i < nums.size(); ++i) {
            max_elem = max(nums[i], max_elem);
        }
        vector count(max_elem + 1, 0);

        for (size_t i{0}; i < nums.size(); ++i) {
            if (nums[i] < 0) {
                cerr << "-ves not supported in this implementation of counting sort \n";
                return nums;
            }
            ++count[nums[i]];
        }

        // now we simply fill the array back
        for (size_t i{0}, j{0}; i < count.size(); ++i) {
            while (count[i] != 0) {
                nums[j] = i;
                ++j;
                --count[i];
            }
        }
        return nums;
    }

    vector<int> &quickSort(vector<int> &nums, int start, int end) {
        //In quick sort, we take a pivot element and then use that for creating a
        //partition in the array where the left elements are all smaller than it and right
        //elements are all bigger than it. Then we repeat this same logic for the right
        //and left subarrays, this sorts the array as the pivot elements end up at the
        //right positions automatically (because when all smaller elements are on the left
        //then nothing will remove the pivot element)
        //The pivot element can be chosen on various partition schemes, which define where
        //the pivot element is picked from. We use the 'Lomuto Partition scheme', which picks
        // the last element as the pivot element.
        if (start >= end) return nums;

        int pivot{nums[end]};
        int p1{start};

        for (int p2 = start; p2 < end; ++p2) {
            if (nums[p2] < pivot) {
                swap(nums[p1], nums[p2]);
                ++p1;
            }
        }

        swap(nums[p1], nums[end]);

        quickSort(nums, start, p1 - 1);
        quickSort(nums, p1 + 1, end);

        return nums;
    }

    void merge(vector<int> &nums, int l1, const int l2, int r1,
               const int r2) {
        vector<int> temp{};
        temp.reserve(l2 - l1 + r2 - r1);
        const int nl1{l1};
        const int nr1{r1};
        while (l1 <= l2 && r1 <= r2) {
            if (nums[l1] < nums[r1]) {
                temp.push_back(nums[l1]);
                ++l1;
            } else {
                temp.push_back(nums[r1]);
                ++r1;
            }
        }

        while (l1 <= l2) {
            temp.push_back(nums[l1]);
            ++l1;
        }
        while (r1 <= r2) {
            temp.push_back(nums[r1]);
            ++r1;
        }
        auto j{temp.begin()};
        for (int i{nl1}; i <= l2; ++i, ++j) {
            nums[i] = *j;
        }
        for (int i{nr1}; i <= r2; ++i, ++j) {
            nums[i] = *j;
        }
    }

    vector<int> &mergeSort(vector<int> &nums, const int start, const int end) {
        if (start >= end) return nums;
        const int mid{start + (end - start) / 2};
        //midpoint cant be just end/2, it has to include start.
        //Why? because end/2 gives a point that can be behind start,
        //however we need a midpoint in between start and mid. This gotcha leads to an infinite
        //recursion, where say start is 4, end is 7, then mid is 3, now 3+1 is 4 which runs the second
        //branch again with 4,7. Not good.
        //Another thing is, we don't need to static cast here, because integers being divided use integer division
        // so they return an int (rounded down) automatically. This also means if we do
        //ceil(intval/2), it will give incorrect value because ceil will recieve a rounded
        //down value as integer division happens inside.
        mergeSort(nums, start, mid);
        mergeSort(nums, mid + 1, end);
        merge(nums, start, mid, mid + 1, end);


        return nums;
    }

    vector<int> radixSort(vector<int> &nums) { return nums; }
    vector<int> heapSort(vector<int> &nums) { return nums; }

    vector<int> bucketSort(vector<int> &nums) { return nums; }
    vector<int> shellSort(vector<int> &nums) { return nums; }


    vector<int> sortArray(vector<int> &nums) {
        const int size{static_cast<int>(nums.size())};
        // return bubbleSort(nums);
        // return insertionSort(nums);
        // return selectionSort(nums);
        // return countingSort(nums);
        // return quickSort(nums, 0, size - 1);
        return mergeSort(nums, 0, size - 1);
    }
};

signed main() {
    vector arr({10, 9, 1, 1, 1, 2, 3, 1}); //10,9,1,1,1,2,3,1
    Solution().sortArray(arr);
    for (int v: arr) {
        cout << v << ' ';
    }
    cout << '\n';
    return 0;
}
