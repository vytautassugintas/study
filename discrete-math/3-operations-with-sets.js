// to allow JS to compare set inside set, you can't simply 
// add new Set([2]) in set, bc new Set([2]) !== new Set([2]);
const setOf2 = new Set([2]);
const setOf3 = new Set([3]);

const A = new Set([2, 3, null]);
const B = new Set([1, 3, 2, setOf2]);
const C = new Set([2, 3]);
const D = new Set([2, setOf3, setOf2, null]);

// A ∪ B = { x: x ∈ A || x ∈ B }
const union = (setA, setB) => 
  new Set([...setA, ...setB]);

// A ∩ B = { x: y ∈ A && x ∈ B }
const intersection = (setA, setB) => 
  new Set([...setA].filter(x => setB.has(x)));

// A \ B = { x: x ∈ A && x ∉ B}
const difference = (setA, setB) =>
  new Set([...setA].filter(x => !setB.has(x)));

// (A ∪ B) ∩ D
const first = () => {
  const step1 = union(A, B);
  const step2 = intersection(step1, D);
  
  return {
    given: {
      A, B, D
    },
    step1, step2
  }
}

// (A ∪ D) \ B
const second = () => {
  const step1 = union(A, D);
  const step2 = difference(step1, B);

  return {
    given: {
      A, B, D
    },
    step1, step2
  }
}

// (B ∪ D) \ C
const third = () => {
  const step1 = union(B, D);
  const step2 = intersection(step1, C);

  return {
    given: {
      B, D, C
    },
    step1, step2
  }
}

const results = {
  1: first(),
  2: second(),
  3: third(),
}

console.log(results);

  
