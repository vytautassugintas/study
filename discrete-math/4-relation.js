function one() {
  const set = [2, 3, 4];

  const result = set.map(num => {
    return set.map(num2 => {
      const sk = Math.abs((3 * num - num2) - 6);
      return sk >= 4
    })
  })

  console.log(result);
}

function two() {
  const set = [0, 5, 6];

  const result = set.map(num => {
    return set.map(num2 => {
      const sk = Math.abs(Math.abs((3 * num - num2) - 6));
      return sk >= 4
    })
  })
  
  console.log(result);
}

two();