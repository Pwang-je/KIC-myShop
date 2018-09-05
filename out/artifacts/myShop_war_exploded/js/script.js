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
    // alert("c");
}