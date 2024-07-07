document.addEventListener('DOMContentLoaded', function () {
    var danhMuc = document.getElementById('danhMuc');
    var dropdownMenu = danhMuc.querySelector('.dropdown-menu');

    // Toggle dropdown menu visibility on click
    danhMuc.addEventListener('click', function (event) {
      event.stopPropagation(); // Prevent event from propagating to the window
      dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
    });

    // Close the dropdown if the user clicks outside of it
    window.addEventListener('click', function (e) {
      if (!danhMuc.contains(e.target)) {
        dropdownMenu.style.display = 'none';
      }
    });
  });

  document.querySelectorAll('.stars').forEach(starsContainer => {
    const stars = starsContainer.querySelectorAll('i');
    
    stars.forEach((star, index) => {
        star.addEventListener('mouseover', () => {
            // Làm tất cả các sao từ sao hiện tại trở về trước thành màu vàng khi hover
            stars.forEach((s, i) => {
                if (i <= index) {
                    s.classList.add('hover');
                } else {
                    s.classList.remove('hover');
                }
            });
        });

        star.addEventListener('mouseout', () => {
            // Xóa màu vàng khi không còn hover
            stars.forEach(s => {
                s.classList.remove('hover');
            });
        });

        star.addEventListener('click', () => {
            // Khi click vào sao, lưu trạng thái sao đã chọn
            stars.forEach((s, i) => {
                s.classList.toggle('selected', i <= index);
            });
        });
    });
});



let currentIndex = 0;
const itemsToShow = 5; // Số lượng thẻ hiện thị cùng lúc

function updateVisibility() {
    const allCourses = document.querySelectorAll('.course-box-wrap-1');
    allCourses.forEach((course, index) => {
        if (index >= currentIndex && index < currentIndex + itemsToShow) {
            course.classList.remove('hidden');
        } else {
            course.classList.add('hidden');
        }
    });
}




// Carousel 1
let currentIndex1 = 0;
const itemsToShow1 = 5; // Số lượng thẻ hiện thị cùng lúc cho Carousel 1

function updateVisibility1() {
    const allCourses1 = document.querySelectorAll('.course-box-wrap-1');
    allCourses1.forEach((course, index) => {
        if (index >= currentIndex1 && index < currentIndex1 + itemsToShow1) {
            course.classList.remove('hidden');
        } else {
            course.classList.add('hidden');
        }
    });
}

function scrollLeft1() {
    const allCourses1 = document.querySelectorAll('.course-box-wrap-1');
    const totalCourses1 = allCourses1.length;

    if (currentIndex1 <= 0) {
        currentIndex1 = totalCourses1 - itemsToShow1;
    } else {
        currentIndex1 -= 1;
    }

    updateVisibility1();
}

function scrollRight1() {
    const allCourses1 = document.querySelectorAll('.course-box-wrap-1');
    const totalCourses1 = allCourses1.length;

    if (currentIndex1 + itemsToShow1 >= totalCourses1) {
        currentIndex1 = 0;
    } else {
        currentIndex1 += 1;
    }

    updateVisibility1();
}

document.addEventListener('DOMContentLoaded', () => {
    updateVisibility1();
    document.querySelector('.carousel-button-left-1').addEventListener('click', scrollLeft1);
    document.querySelector('.carousel-button-right-1').addEventListener('click', scrollRight1);
});


// Carousel 2
let currentIndex2 = 0;
const itemsToShow2 = 5; // Số lượng thẻ hiện thị cùng lúc cho Carousel 2

function updateVisibility2() {
    const allCourses2 = document.querySelectorAll('.course-box-wrap-2');
    allCourses2.forEach((course, index) => {
        if (index >= currentIndex2 && index < currentIndex2 + itemsToShow2) {
            course.classList.remove('hidden');
        } else {
            course.classList.add('hidden');
        }
    });
}

function scrollLeft2() {
    const allCourses2 = document.querySelectorAll('.course-box-wrap-2');
    const totalCourses2 = allCourses2.length;

    if (currentIndex2 <= 0) {
        currentIndex2 = totalCourses2 - itemsToShow2;
    } else {
        currentIndex2 -= 1;
    }

    updateVisibility2();
}

function scrollRight2() {
    const allCourses2 = document.querySelectorAll('.course-box-wrap-2');
    const totalCourses2 = allCourses2.length;

    if (currentIndex2 + itemsToShow2 >= totalCourses2) {
        currentIndex2 = 0;
    } else {
        currentIndex2 += 1;
    }

    updateVisibility2();
}

document.addEventListener('DOMContentLoaded', () => {
    updateVisibility2();
    document.querySelector('.carousel-button-left-2').addEventListener('click', scrollLeft2);
    document.querySelector('.carousel-button-right-2').addEventListener('click', scrollRight2);
});


// Carousel 3
let currentIndex3 = 0;
const itemsToShow3 = 5; // Số lượng thẻ hiện thị cùng lúc cho Carousel 3

function updateVisibility3() {
    const allCourses3 = document.querySelectorAll('.course-box-wrap-3');
    allCourses3.forEach((course, index) => {
        if (index >= currentIndex3 && index < currentIndex3 + itemsToShow3) {
            course.classList.remove('hidden');
        } else {
            course.classList.add('hidden');
        }
    });
}

function scrollLeft3() {
    const allCourses3 = document.querySelectorAll('.course-box-wrap-3');
    const totalCourses3 = allCourses3.length;

    if (currentIndex3 <= 0) {
        currentIndex3 = totalCourses3 - itemsToShow3;
    } else {
        currentIndex3 -= 1;
    }

    updateVisibility3();
}

function scrollRight3() {
    const allCourses3 = document.querySelectorAll('.course-box-wrap-3');
    const totalCourses3 = allCourses3.length;

    if (currentIndex3 + itemsToShow3 >= totalCourses3) {
        currentIndex3 = 0;
    } else {
        currentIndex3 += 1;
    }

    updateVisibility3();
}

document.addEventListener('DOMContentLoaded', () => {
    updateVisibility3();
    document.querySelector('.carousel-button-left-3').addEventListener('click', scrollLeft3);
    document.querySelector('.carousel-button-right-3').addEventListener('click', scrollRight3);
});
