document.querySelectorAll('.slider_content').forEach((content, index) => {
    // 배경 이미지를 설정하겠다
    content.style.backgroundImage = `url('resources/img/hotelEvent/${index + 1}.jpg')`;
    content.style.backgroundSize = '100%';
    content.style.backgroundRepeat = 'no-repeat';
    content.innerText = '';
});

let width = 0;  // sliderHandler가 실행될 때 마다, 변해야 하는 값

const sliderHandler = () => {
    width += 720;
    if(width === 3600){
        width = 0;
    }
//    console.log(width)
    const slider_list = document.querySelector('.slider_list');
    slider_list.style.transform = `translate3d(-${width}px, 0px, 0px)`;
    //translate3d(x, y, z) : 요소를 x축, y축, z축으로 지정한 만큼 이동시킨다

    slider_list.style.transition = '400ms';
};
setInterval(sliderHandler, 3000);