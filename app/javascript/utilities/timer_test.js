document.addEventListener('turbolinks:load', function () {
    const timer = document.getElementById('timer');

    if (timer) {
        var passed_time = timer.dataset.timer;

        setInterval(function () {
            passed_time ? passed_time-- : document.querySelector('form').submit()
            changeTimer(passed_time, timer)
        }, 1000)
    }
})

function changeTimer(timer_count, timer_obj) {
    timer_obj.innerHTML = ('Оставшееся время: ' + timer_count);
}
