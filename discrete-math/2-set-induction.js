
const rule1 = a => a.includes('a') && a.includes('b2');

const t = [
  'aab2',
  'aaba1',
  'baa1aa1',
  'bb2ba1a1',
  'bba1a1b2',
  'ababa1',
  'aabbaa1aaba1a1'
]

const r = t.map(d => ({
  data: d,
  pass: rule1(d)
}))

console.log(r);