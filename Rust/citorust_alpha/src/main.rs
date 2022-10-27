use futures::{FutureExt, pin_mut};


fn main(){
    let x= yo();
}
async fn yo(){
    let x =yy().await?;
}

async fn yy(){}