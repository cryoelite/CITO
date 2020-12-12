try { 
    process.kill(16648,'SIGTERM');
} catch{
    console.log('Error');
}