const args=require('minimist')
const pargs=args(process.argv.slice(2));
console.log(pargs['name']);