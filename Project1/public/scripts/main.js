// Wrap your code inside the DOMContentLoaded event listener
document.addEventListener('DOMContentLoaded', function() {

    // Navbar script
    const hamburger = document.querySelector(".hamburger");
    const navLinks = document.querySelector(".nav-links");
    const links = document.querySelectorAll(".nav-links li");

    hamburger.addEventListener('click', () => {

        //Animate Links
        navLinks.classList.toggle("open");

        links.forEach(link => {

            link.classList.toggle("fade");
        });s

        //Hamburger Animation
        hamburger.classList.toggle("toggle");
    });

    // Bahrainimg.index
    const imageContainer = document.querySelector(".image-container");

    // Add event listener to the image container
    imageContainer.addEventListener("mouseenter", function() {

        // Zoom in effect on hover
        this.querySelector("img").style.transform = "scale(1.1)";
    });

    // Add event listener to revert changes on mouse leave
    imageContainer.addEventListener("mouseleave", function() {

        // Revert zoom effect on mouse leave
        this.querySelector("img").style.transform = "scale(1)";
    });

});

// Wrap your code inside the DOMContentLoaded event listener
document.addEventListener('DOMContentLoaded', function() {
    // Navbar script
    const hamburger = document.querySelector(".hamburger");
    const navLinks = document.querySelector(".nav-links");
    const links = document.querySelectorAll(".nav-links li");

    hamburger.addEventListener('click', () => {
        //Animate Links
        navLinks.classList.toggle("open");
        links.forEach(link => {
            link.classList.toggle("fade");
        });

        //Hamburger Animation
        hamburger.classList.toggle("toggle");
    });
});

// Wrap your code inside the DOMContentLoaded event listener
document.addEventListener('DOMContentLoaded', function() {
    // Navbar script
    const hamburger = document.querySelector(".hamburger");
    const navLinks = document.querySelector(".nav-links");
    const links = document.querySelectorAll(".nav-links li");

    hamburger.addEventListener('click', () => {
        //Animate Links
        navLinks.classList.toggle("open");
        links.forEach(link => {
            link.classList.toggle("fade");
        });

        //Hamburger Animation
        hamburger.classList.toggle("toggle");
    });
});

let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
showSlides(slideIndex = n);
}

function showSlides(n) {
let i;
let slides = document.getElementsByClassName("mySlides");
let dots = document.getElementsByClassName("dot");
if (n > slides.length) {slideIndex = 1}
if (n < 1) {slideIndex = slides.length}
for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
}
for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
}
slides[slideIndex-1].style.display = "block";
dots[slideIndex-1].className += " active";
}