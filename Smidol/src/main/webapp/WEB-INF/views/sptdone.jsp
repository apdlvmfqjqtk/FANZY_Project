<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제 완료</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    section {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 30px;
      text-align: center;
      width: 400px;
    }
    #head {
      border-bottom: 2px solid #F5C3B2;
      padding-bottom: 15px;
      margin-bottom: 20px;
    }
    h2 {
      color: #F5C3B2;
      margin-bottom: 5px;
    }
    h4 {
      color: #555;
      font-weight: normal;
    }
    #main {
      text-align: left;
    }
    .info-row {
      display: flex;
      justify-content: space-between;
      padding: 10px;
      border-bottom: 1px solid #ddd;
    }
    .label {
      font-weight: bold;
      color: #555;
      flex: 1;
      text-align: left;
    }
    .value {
      flex: 2;
      text-align: right;
      color: #333;
    }
    .highlight {
      color: #007bff;
      font-weight: bold;
    }
    button {
      background: #F5C3B2;
      color: white;
      border: none;
      padding: 15px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      margin-top: 20px;
      width: 100%;
    }
    button:hover {
      background: #ec8e6e;
    }
  </style>
</head>
<body>
  <section>
    <div id="head">
      <h2>결제 완료</h2>
      <h4>해당 정보로 결제 완료되었습니다.</h4>
    </div>
    <div id="main">
      <div class="info-row"><div class="label">계좌:</div> <div class="value">123-4567-8901</div></div>
      <div class="info-row"><div class="label">주문번호:</div> <div class="value">#20250227</div></div>
      <div class="info-row"><div class="label">배송지:</div> <div class="value">서울특별시 강남구</div></div>
      <div class="info-row"><div class="label">배송수단:</div> <div class="value">택배</div></div>
      <div class="info-row"><div class="label">배송메모:</div> <div class="value">문 앞에 놓아주세요.</div></div>
      <button>확인</button>
    </div>
  </section>
</body>
</html>
