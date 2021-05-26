// 서브메뉴 (모달창)
const open_submenu = document.getElementById('open_submenu');
const close_submenu = document.getElementById('close_submenu');
const modal = document.querySelector('.modal-login');

open_submenu.onclick = function() {
	modal.classList.remove('hidden');
}

close_submenu.onclick = function() {
	modal.classList.add('hidden');
}