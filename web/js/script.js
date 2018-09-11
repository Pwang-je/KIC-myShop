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
    if (regForm.id.value === "") {
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

// 회원정보 수정
function memUpdate(id) {
    document.updateFrm.id.value = id;
    document.updateFrm.submit();
}

function memUpdateAdminFunc() {
    document.updateFormAdmin.submit();
}
function memUpdateCancleAdminFunc() {
    location.href = "../admin/membermanager.jsp";
}


function productDetail(no) {
    document.detailFrm.no.value = no;
    document.detailFrm.submit();
}

function productUpdate(no) {
    document.updateFrm.no.value = no;
    document.updateFrm.submit();
}

function productDelete(no) {
    if (confirm('삭제함?')) {
        document.delFrm.no.value = no;
        document.delFrm.submit();
    }
}

// 장바구니 처리용
function cartUpdate(form) {
    form.flag.value = "update";
    form.submit();
}
function cartDelete(form) {

}


function orderDetail(no) {
    document.detailFrm.no.value = no;
    document.detailFrm.submit();
}

function orderUpdate(form) {
    document.orderDetailFrm.flag.value = "update";
    form.submit();
}