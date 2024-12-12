document.addEventListener('turbolinks:load', function() {
    var progressBar = document.getElementById('progressbar')

    if (progressBar) {
        var currentQuestion = progressBar.dataset.currentQuestion
        var totalQuestions = progressBar.dataset.totalQuestions
        var progressPercentage = (currentQuestion / totalQuestions) * 100

        progressBar.style.width = '${progressPercentage}%'
        progressBar.setAttribute('aria-valuenow', progressPercentage)
    }
})
