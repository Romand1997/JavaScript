<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 06.12.2022
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!-- Кнопка-триггер модального окна -->
    <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#addBrand">
        Add new brand
    </a>
    <!-- Модальное окно -->
    <div class="modal fade" id="addBrand" tabindex="-1" aria-labelledby="addBrandLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addBrandLabel">Adding new brand</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                </div>
                <div class="modal-body">
                    <div class="container" input-group>
                        <form action="/AdminPanelServlet?flag=brand" method="post">
                            <label for="nameOfBrand" class="mt-3 mb-1">
                                Name:
                            </label>
                            <div class="mb-3">
                                <input type="text" class="form-control" aria-label="Вводит название бренда"
                                       aria-describedby="inputGroup-sizing-default"
                                       name="nameOfBrand" id="nameOfBrand" required>
                            </div>
                            <label for="countryOfBrand" class="mt-3 mb-1">
                                Country:
                            </label>
                            <div class="mb-3">
                                <input type="text" class="form-control" aria-label="Вводит страну бренда"
                                       aria-describedby="inputGroup-sizing-default"
                                       name="country" id="countryOfBrand" required>
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

