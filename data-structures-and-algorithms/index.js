const {
  createRandomArray,
  calculateRepeatsWithWhile,
  calculateRepeatsWithReduce, 
} = require('./1-repeat-in-array');

const { printTriangleOfZeros } = require('./8-tiangle-of-zeros')

const randomArray = createRandomArray(10);
const randomArraySortedCopy = [...randomArray].sort();

// 1
console.log('1.')
console.log({
  input: randomArray,
  inputSorted: randomArraySortedCopy,
  inputUnique: [...new Set(randomArraySortedCopy)],
  result: calculateRepeatsWithWhile(randomArray),
  result2: calculateRepeatsWithReduce(randomArray)
});

// 8
console.log('\n8.');
printTriangleOfZeros(6);