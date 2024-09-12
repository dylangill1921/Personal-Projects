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
