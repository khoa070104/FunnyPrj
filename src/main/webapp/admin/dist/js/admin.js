function showAdminProfile() {
    document.getElementById('adminProfile').style.display = 'block';
    document.getElementById('searchBar').style.display = 'none';
    document.getElementById('userManagement').style.display = 'none';
    document.getElementById('courseManagement').style.display = 'none';
    document.getElementById('messageCenter').style.display = 'none';
}

function showSearchBar() {
    document.getElementById('adminProfile').style.display = 'none';
    document.getElementById('searchBar').style.display = 'block';
    document.getElementById('userManagement').style.display = 'none';
    document.getElementById('courseManagement').style.display = 'none';
    document.getElementById('messageCenter').style.display = 'none';
}

function showUserManagement() {
    document.getElementById('adminProfile').style.display = 'none';
    document.getElementById('searchBar').style.display = 'none';
    document.getElementById('userManagement').style.display = 'block';
    document.getElementById('courseManagement').style.display = 'none';
    document.getElementById('messageCenter').style.display = 'none';
}

function showCourseManagement() {
    document.getElementById('adminProfile').style.display = 'none';
    document.getElementById('searchBar').style.display = 'none';
    document.getElementById('userManagement').style.display = 'none';
    document.getElementById('courseManagement').style.display = 'block';
    document.getElementById('messageCenter').style.display = 'none';
}

function showMessageCenter() {
    document.getElementById('adminProfile').style.display = 'none';
    document.getElementById('searchBar').style.display = 'none';
    document.getElementById('userManagement').style.display = 'none';
    document.getElementById('courseManagement').style.display = 'none';
    document.getElementById('messageCenter').style.display = 'block';
}

function logout() {
    window.location.href = '/FunnyCodeWeb/logout';
}