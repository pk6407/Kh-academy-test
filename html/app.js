// 배열 리터럴
const arr = [1,2, `문자열`, {}]
const [a, b] = arr
console.log(a)
console.log(b)

// 객체 리터럴
const user = {
    id: `abcdefg`,
    name: `chiho Won`,
    data: [1,2,3,4,],
}

const{id, name, data} = user
console.log(id)
console.log(name)
console.log(data)

function f(x){
    console.log(name)
    console.log(x)
}
f(5)
x

console.log(`블록 이전에 호출`)
{
    console.log(`블록 내부에서 호출됨`)
    const x = 1
    console.log(x)
    {
        console.log(`블록 내부 2에서 호출됨`)
        const y = 5
        console.log(y)
    }
    console.log(x)
}
console.log(x)

console.log('블록 이전에 호출')
{
    const x = 10
    const block1 = '블록1이란다'
    console.log(x)
    {
        const x = '다른타입의 값'
        console.log(x)
        console.log(block1)
    }
}


function sayHelloTo(name){
    const message = `Hello ${name}!`
    return function(){
        console.log(message)
    }
}

const hello1 = sayHelloTo(`Chiho Won`)
const hello2 = sayHelloTo(`Test`)
const hello3 = sayHelloTo(`adsf`)
hello1
hello2
hello3

function outer(){
    const name = `바깥임`
    function showName(){
        const n = `안쪽 데이터`
        console.log(`바깥: ${name}, 안: ${n}`)
    }
    showName()
}
outer()

function outer(){
    const name = `바깥임`
    function showName(){
        const n = `안쪽 데이터`
        console.log(`바깥: ${name}, 안: ${n}`)
    }
    return showName()
}
const f1 = outer()
f1()    // showName

const dd = `ㅇㅇ`
function outer(){
    const name = `밖에 있어요`  // 유효 범위
    function closure(){ // 클로저
        const inner = `내부에`
        console.log(`${name}, ${inner}, ${dd}`)
    }
    return closure
}
const f1 = outer()
f1()

function countdown(x){
    // 환경
    function counter(){

    }
    return counter
}

function countdown(startAt){
    let data = startAt;
    function counter(){
        console.log(data--)
    }
    return counter
}
const counter = countdown(10)
counter()   // 10
counter()   // 9
counter()   // 8

function countdown(startAt){
    let data = startAt;
    function counter(){
        console.log(data--)
    }
    return counter
}
const c1 = countdown(10)
const c2 = countdown(100)
c1()
c1()
c2()
c2()

class 클로저{
    멤버;
    생성자(파라미터){
        멤버 = 파라미터
    }

    메서드(){

    }
}

function 생성자(파라미터){
    function 메서드(){
    }
    return 메서드
}
