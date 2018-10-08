const createRandomArray = elementsCount => Array(elementsCount)
  .fill()
  .map(() => Math.round(Math.random() * 9));

// 1
const calculateRepeatsWithReduce = array => {
  const arrayCopy = [...array];
  return arrayCopy.reduce((map, current) => {
    map[current]
      ? map[current] = ++map[current]
      : map[current] = 1;
    return map;
  }, {})
}

const calculateRepeatsWithWhile = array => {
  const sortedArray = [...array].sort();
  const repeatsArray = [];
  
  let count = 1;

  while (sortedArray.length) {
    const currentElement = sortedArray[0];
    const nextElement = sortedArray[1];

    if (currentElement === nextElement) {
      count++;
    } else {
      repeatsArray.push(count);
      count = 1;
    }

    sortedArray.shift();
  }

  return repeatsArray;
}

const randomArray = createRandomArray(10);
const randomArraySortedCopy = [...randomArray].sort();

console.log({
  input: randomArray,
  inputSorted: randomArraySortedCopy,
  inputUnique: [...new Set(randomArraySortedCopy)],
  result: calculateRepeatsWithWhile(randomArray),
  result2: calculateRepeatsWithReduce(randomArray)
});
