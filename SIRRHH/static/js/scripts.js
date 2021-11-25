// SCROLL CHANGE NAVBAR POSITION 7u7
window.addEventListener('scroll', () =>{
  let nav = document.getElementById('navi');

  if (window.scrollY > 300)
  {
    nav.classList.remove('sticky-top');
    nav.classList.remove('medium-nav');
    //nav.classList.remove('navbar-dark');
   // nav.classList.add('navbar-light');
    nav.classList.add('fixed-bottom');
  }else{
    nav.classList.remove('fixed-bottom');
    
    nav.classList.add('sticky-top');
  }
  
});

  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");

  closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

  searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
    sidebar.classList.toggle("open");
    menuBtnChange(); //calling the function(optional)
  });

  // following are the code to change sidebar button(optional)
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
   }
  }