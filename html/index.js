// express 프레임워크 임포트
const express = require('express')
const app = express()
const PORT = 6600   // 포트 번호

// 미들웨어 추가
app.use(express.static(`./static`))

/**
 *  경로 : /data
 *  요청 HTTP 메서드 : GET
 */

// 더미 데이터
app.get('/data', (req, res) => {
    const data = {
        id: '특이한야옹이',
        name: '야옹이',
        myData: [501,707,444,666,`rainbow six siege`],
        timestamp: new Date(),
    }
    // data 객체를 json으로 서빙해줌
    // JSON: Javascript Object Notation
    res.json(data)
})


// 애플리케이션 시작!
app.listen(PORT, () => {
    console.log('애플리케이션이 시작됨.')
})
// 종료 할때 컨트롤+c 누르기