document.addEventListener('turbolinks:load', () => {
    const progressBar = document.querySelector('.progress')
    if (progressBar) ProgressBar()
})

function ProgressBar() {
    let progressBar = document.querySelector('.progress-bar')
    const width = progressBar.dataset.progressPercent
    progressBar.style.width = `${width}%`
}
