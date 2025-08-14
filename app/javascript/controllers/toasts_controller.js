const showToasts = () => {
  const toastElList = [].slice.call(document.querySelectorAll(".toast"));
  toastElList.forEach((toastEl) => {
    const toast = new bootstrap.Toast(toastEl, { delay: 3000 });
    toast.show();
  });
};

document.addEventListener("DOMContentLoaded", showToasts);
document.addEventListener("turbo:load", showToasts);
