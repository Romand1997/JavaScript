<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 06.12.2022
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--&lt;%&ndash;  <!-- Кнопка-триггер модального окна --><a class="dropdown-item" href="#">&ndash;%&gt;        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Открыть второе модальное окно</button>--%>

<a  class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Add new item
  </a>
  <!-- Модальное окно -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Adding new item</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
        </div>
        <div class="modal-body">
          <div class="container" input-group>
            <form action="/AdminPanelServlet?flag=item" method="post">
              <label for="nameOfInput" class="mt-3 mb-1">
                Name:
              </label>
              <div class="mb-3">
                <input type="text" class="form-control" aria-label="Вводит название товара"
                       aria-describedby="inputGroup-sizing-default"
                       name="name" id="nameOfInput" required>
              </div>
              <label for="nameOfBrand" class="mb-1">
                Brand:
              </label>
              <div class="mb-3">
                <select class="form-select" aria-label="Вводит название Brand-a" id="nameOfBrand"
                        name="brand">
                  <% ArrayList <Brand> brands = (ArrayList<Brand>) request.getAttribute("brands");
                    if (brands!=null){
                      for (Brand brand : brands){
                  %>
                  <option value="<%=brand.getId()%>"><%=brand.getName()+" " +
                          ""+brand.getCountry()%></option>
                  <%
                      }
                    }
                  %>
                </select>
              </div>
              <label for="nameOfBrand" class="mb-1">
                Category:
              </label>
              <div class="mb-3">
                <select class="form-select" aria-label="Выбирает категорию" id="nameOfСategory"
                        name="category">
                  <%
                    if (categories!=null){
                      for (Category category : categories){       //Это не ошибка!!!!!
                  %>
                  <option value="<%=category.getId()%>"><%=category.getNameOfCategory()%></option>
                  <%
                      }
                    }
                  %>
                </select>
              </div>
              <label for="price" class="mb-1">
                Price:
              </label>
              <div class="mb-3">
                <input type="number" class="form-control" aria-label="Вводит цену товара"
                       aria-describedby="inputGroup-sizing-default"
                       name="price" id="price" required>
              </div>
              <label for="descriptionOfInput" class="mb-1">
                Description:
              </label>
              <div class="mb-3">
                <textarea class="form-control" aria-label="Вводит содержание товара"
                          name="description"
                          id="descriptionOfInput"></textarea>
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
