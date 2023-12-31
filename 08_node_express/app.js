const express = require('express');
const app = express();
const PORT = 8080;

//express에게 템플릿 엔진 등록
app.set('view engine', 'ejs'); // express에서 사용할 템플릿 엔진 종류(ejs)등록
app.set('views', './views'); // 템플릿 엔진 파일을 저장할 위치 등록

//static 미들웨어 등록
app.use('/public', express.static(__dirname + '/static'));

// (임시) 데이터베이스에서 가져온 회원 정보(id, pw)
const idFromDB = 'banana';
const pwFromDB = '1234qwer';

// app.get(경로, 해당 경로로 들어왔을 때 실행할 함수)
// '/': 서버주소: 포트번호/ (Localhost:8080/)
app.get('/', function (req, res) {
  // send(x): x를 클라이언트한테 응답으로 보냄
  // res.send('<h1>hello express!!!!</h1>');

  //render(ejs_filename): ejs file 이름을 찾아서 응답
  res.render('index', {
    // 뒤에 값을 보낼 수 있음
    userId: idFromDB,
    userPw: pwFromDB,
    btns: ['사과', '오렌지', '키위'],
    me: {
      name: 'jihyung',
      msg: '안녕하세요',
    },
    isLogin: true,
  });
});

// '/sessac'(서버주소: 포트번호/sessac)경로로 들어왓을 때 "새싹 영등포캠퍼스 5기 수업중" 메세지 보내기
app.get('/sessac', function (req, res) {
  res.send('<h1>새싹 영등포캠퍼스 5기 수업중</h1>');
});

// 서버가 실행할 PORT 지정하고, 실행했을 때 콘솔로그를 찍음
app.listen(PORT, function () {
  console.log(`server listening on ${PORT} port`);
});

///퀴즈
// 1. /login 경로로 요청이 들어오면 로그인 페이지(ejs)를 응답
app.get('/login', function (req, res) {
  res.render('login');
});
app.get('/logincomplete', function (req, res) {
  res.render('logincomplete');
});
// 2. /register 경로로 요청이 들어오면 회원가입 페이지(ejs)를 응답
app.get('/register', function (req, res) {
  res.render('register');
});
// 서버가 실행할 PORT 지정하고, 실행했을 때 콘솔로그를 찍음
