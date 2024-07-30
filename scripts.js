document.addEventListener('DOMContentLoaded', function() {
    const postForm = document.getElementById('postForm');
    const postsContainer = document.getElementById('postsContainer');

    postForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const title = document.getElementById('postTitle').value;
        const content = document.getElementById('postContent').value;

        const post = document.createElement('div');
        post.classList.add('post');
        post.innerHTML = `
            <h4>${title}</h4>
            <p>${content}</p>
        `;

        postsContainer.appendChild(post);

        postForm.reset();
    });
});
