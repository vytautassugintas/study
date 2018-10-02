// A ∪ B = { x: x ∈ A || x ∈ B }
const union = (setA, setB) => 
  new Set([...setA, ...setB]);

// A ∩ B = { x: y ∈ A && x ∈ B }
const intersection = (setA, setB) => 
  new Set([...setA].filter(x => setB.has(x)));

// A \ B = { x: x ∈ A && x ∉ B }
const difference = (setA, setB) =>
  new Set([...setA].filter(x => !setB.has(x)));


// A x B = { (x, y): x ∈ A && y ∈ B }
const f = (a, b) => [].concat(...a.map(d => b.map(e => [].concat(d, e))));
const cartesian = (a, b, ...c) => (b ? cartesian(f(a, b), ...c) : a);

module.export = {
  union,
  intersection,
  difference,
  cartesian
}