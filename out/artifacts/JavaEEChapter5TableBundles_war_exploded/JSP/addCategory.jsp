<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 06.12.2022
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

  <!-- Кнопка-триггер модального окна -->
  <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#addCategory">
    Add new category
  </a>
  <!-- Модальное окно -->
  <div class="modal fade" id="addCategory" tabindex="-1" aria-labelledby="addCategoryLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addCategoryLabel">Adding new category</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
        </div>
        <div class="modal-body">
          <div class="container" input-group>
            <form action="/AdminPanelServlet?flag=category" method="post">
              <label for="nameOfCategory" class="mt-3 mb-1">
                Name:
              </label>
              <div class="mb-3">
                <input type="text" class="form-control" aria-label="Вводит название товара"
                       aria-describedby="inputGroup-sizing-default"
                       name="nameOfCategory" id="nameOfCategory" required>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                  Закрыть
                </button>
                <button class="btn btn-primary">Сохранить изменения</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

