const printTriangleOfZeros = height => {
  for (let i = 1; i <= height; i++) {
    let spaces = ''
    let signs = '0'.repeat(i * 2).substr(1);
    for (let j = height - i; j >= 0; j--) {
      spaces += " ";
    }
    console.log(`|${spaces}${signs}${spaces}|`);
  }
}

module.exports = {
  printTriangleOfZeros
}
