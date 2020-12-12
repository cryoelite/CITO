const koa=require('koa');
const app= new koa;

app.use(async (ctx) => {
ctx.body='Hi';
});

const server=app.listen(8080);

process.on('SIGTERM', ()=>{
  server.close(()=> console.log("Yolo"));
})
