module.exports=(options,app)=>{
    return async function jurisdiction(ctx,next){
        await next()
    }
}