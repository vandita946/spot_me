
const initModalVisitors = () => {
    const modalContainer = document.querySelector('.notauser');
    if (modalContainer) {
        $(document).ready(function(){
            $("#staticBackdrop").modal('show');
        });

    }
}
  
export { initModalVisitors };