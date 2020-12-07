const koa= require('koa');
const app=new koa();

app.use(async ctx =>{
    ctx.body='Juice world';
});
app.listen(8080);