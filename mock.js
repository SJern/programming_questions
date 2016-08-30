function digital_root(num) {
  while (num > 10) {
    num = digit_sum(num);
  }
  return num;
}

function digit_sum(num) {
  let sum = 0;
  while (num > 0) {
    sum += (num % 10);
    num = Math.floor(num / 10);
  }
  return sum;
}

function caesar_cipher(string, shift) {
  let newStr = ""
  for (let i = 0, len = string.length; i < len; i++) {
    if (string[i] === ' ') {
      newStr += ' ';
    } else {
      let shifted = ((string.charCodeAt(i) - 97) + shift) % 26 + 97;
      newStr += String.fromCharCode(shifted);
    }
  }
  return newStr;
}
