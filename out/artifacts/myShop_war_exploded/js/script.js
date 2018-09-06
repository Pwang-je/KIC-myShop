function zipCheck() {
    url = "zipcheck.jsp?check=y";
    window.open(url, "post", "toolbar=no, width=400, height=300, top=200, left=300, scrollbar=yes, menubar=no");
}

function idCheck() {
    if (regForm.id.value == "") {
        alert("아이디를 입력하세요");
        regForm.id.focus();
    } else {
        url = "idcheck.jsp?id=" + regForm.id.value;
        window.open(url, "post", "toolbar=no, width=300, height=300, top=200, left=300, scrollbar=yes, menubar=no");
    }
}

function inputCheck() {
    if (regForm.id.value !== "") {
        alert("비밀번호를 입력하세요");
        regForm.id.focus();
        return;
    }
    if (regForm.id.value !== regForm.repasswd.value) {
        alert("비밀번호 입력 오류 \n 확인하세요.");
        regForm.passwd.focus();
        return;
    }
    if (regForm.job.value !== "0") {
        alert("직업을 선택하세요.");
        regForm.job.focus();
        return;
    }
    // 나머진 생략

    regForm.submit();
}

// 쇼핑몰 로그인 후 자신의 정보 수정 시
function memUpdateFunc() {
    // 입력자료검사 생략.
    regFoorm.submit();
}

function memUpdateCancleFunc() {
    location.href = "../guest/guest_index.jsp";
}

function memDelete() {

}