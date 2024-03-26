const part = document.querySelectorAll(".box_poll_graph")
const questions = document.querySelectorAll(".list_poll_graph");
const color = ["rosybrown", "darkcyan", "tomato", "yellow", "violet", "grey", "orange"];
let rect = questions[0].offsetWidth;

//** X축 구하기 
for(let i = 0; i < part.length ; i++ ){
    const xArr = new Array(); 
    let xNum = document.createElement("div");
    xNum.className = "score_list";
    part[i].append(xNum);  
}


for(let i=0; i < questions.length ; i++ ){
    //** 그래프 그리기
    const lis = questions[i].querySelectorAll("li");
    const scoreValue = new Array();
    rect = questions[i].style.width = rect/rect * 100;
   
    for(let b = 0; b < lis.length ; b++ ){
        let bar = document.createElement("div")
        let num = null;
        let width = null;

        num = lis[b].querySelector(".txt_num").innerHTML;
        scoreValue.push(+ num);
        bar.className = "bar";
        bar.style.width = `${scoreValue[b] / rect * 100}%`; 
        bar.style.height = "20px";
        bar.style.backgroundColor = color[b];
        lis[b].append(bar);
    }
 

}
