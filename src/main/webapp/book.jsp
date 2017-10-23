<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>Books CRUD</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" charset="utf-8">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body onload="load();">
<div class="container">
    <h2 align="center">Books CRUD</h2>
    <button id="btn_createDialog" type="button" class="btn btn-default" onclick="showCreateDialog();">Add book <span class="glyphicon glyphicon-plus-sign"></span></button>
    <hr style="margin:5px">
    <table id="MainTable" class="table table-hover" border=1>
        <thead>
        <tr>
            <th> ID</th>
            <th> Title</th>
            <th> Description</th>
            <th> Author</th>
            <th> ISBN</th>
            <th> Print Year</th>
            <th> Read Already</th>

            <th> Read</th>
            <th> Edit</th>
            <th> Delete</th>
        </tr>
        </thead>

    </table>

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove-sign"></span></button>
                    <h4 id="modalHeader" class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <p id="modalPage"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="details" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove-sign"></span></button>
                    <h4 id="detailsHeader" class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <p id="detailsPage">
                    <table class="table" width="100%">
                        <tr>
                            <td>ID</td>
                            <td>
                                <input type="text" class="form-control" id="id" name="id" readonly="true">
                            </td>
                        </tr>
                        <tr>
                            <td>Title</td>
                            <td>
                                <input type="text" class="form-control" id="title" name="title">
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>
                  <textarea class="form-control" id="description" name="description" >
                  </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Author</td>
                            <td>
                                <input disabled="disabled" type="text" class="form-control" id="author" name="author">
                            </td>
                        </tr>
                        <tr>
                            <td>ISBN</td>
                            <td>
                                <input type="text" class="form-control" id="isbn" name="isbn">
                            </td>
                        </tr>
                        <tr>
                            <td>Print Year</td>
                            <td>
                                <input type="number" class="form-control numbersOnly" id="printYear" name="printYear">
                            </td>
                        </tr>
                        <tr>
                            <td>Read Already</td>
                            <td>
                                <div class="col-xs-2">
                                    <input disabled="disabled" type="checkbox" value="" id="readAlready" name="readAlready">
                                </div>
                            </td>
                        </tr>
                    </table>
                    </p>
                </div>
                <div class="modal-footer">
                    <button id="btn_create" type="button" class="btn btn-default" onclick="create();">Add new <span class="glyphicon glyphicon-plus-sign"></span></button>
                    <button id="btn_save" disabled="disabled" type="button" class="btn btn-default" onclick="save(false);">Save <span class="glyphicon glyphicon-floppy-saved"></span></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close <span class="glyphicon glyphicon-floppy-remove"></span></button>
                </div>
            </div>
        </div>
    </div></div>


<script type="text/javascript">
    $('.numbersOnly').keyup(function () {
        this.value = this.value.replace(/[^0-9\.]/g,'');
    });

    data = "";
    save = function (readAlready_) {
        $.ajax({
            url: 'saveOrUpdate',
            type: 'POST',
            data: {
                id: $("#id").val(),
                title: $('#title').val() == "" ? 'title' : $('#title').val(),
                description: $('#description').val() == "" ? 'description' : $('#description').val(),
                author: $('#author').val() == "" ? 'author' : $('#author').val(),
                isbn: $('#isbn').val() == "" ? 'isbn' : $('#isbn').val(),
                printYear: $('#printYear').val() == "" ? 0 : $('#printYear').val(),
                readAlready: readAlready_,
            },
            success: function () {
                load();
            },
            error: function () {
                showModal('Error','An error has occurred!');
            },
            complete: function() {
                $('#details').modal('hide');
            }
        });
    }

    read = function (index) {
        $.ajax({
            url: 'saveOrUpdate',
            type: 'POST',
            data: {
                id: data[index].id,
                title: data[index].title,
                description:  data[index].description,
                author:  data[index].author,
                isbn:  data[index].isbn,
                printYear:  data[index].printYear,
                readAlready: true
            },
            success: function () {
                load();
            },
            error: function () {
                showModal('Error','An error has occurred!');
            },
        });
    }

    delete_ = function (id) {
        $.ajax({
            url: 'delete',
            type: 'POST',
            data: {id: id},
            success: function () {
                load();
                clean();
            },
            error: function () {
                showModal('Error','An error has occurred!');
            }
        });
    };

    create = function () {
        $.ajax({
            url: 'saveOrUpdate',
            type: 'POST',
            data: {

                title: $('#title').val() == "" ? 'title' : $('#title').val(),
                description: $('#description').val() == "" ? 'description' : $('#description').val(),
                author: $('#author').val() == "" ? 'author' : $('#author').val(),
                isbn: $('#isbn').val() == "" ? 'isbn' : $('#isbn').val(),
                printYear: $('#printYear').val() == "" ? 0 : $('#printYear').val(),
                readAlready: false,
            },
            success: function () {
                load();
                clean();
            },
            error: function () {
                showModal('Error','An error has occurred!');
            },
            complete: function () {
                $('#details').modal('hide');
            }
        });
    }

    edit = function (index) {
        $("#id").val(data[index].id);
        $("#title").val(data[index].title);
        $("#description").val(data[index].description);
        $("#author").val(data[index].author);
        $("#isbn").val(data[index].isbn);
        $("#printYear").val(data[index].printYear);
        $("#readAlready")[0].checked = data[index].readAlready;
        $('#btn_save').removeAttr('disabled');
        showDetails("Details");
    }

    load = function () {
        $.ajax({
            url: 'list',
            type: 'POST',
            success: function (response) {
                data = response.data;
                $('#MainTable').DataTable({
                    destroy: true
                }).destroy();
                $('#MainTable .tr').remove();
                $("#MainTable").append("<tbody>")
                for (i = 0; i < response.data.length; i++) {
                    $("#MainTable").append("<tr class='tr'> " +
                        "<td> " + response.data[i].id + " </td> " +
                        "<td> " + response.data[i].title + " </td> " +
                        "<td> " + response.data[i].description + " </td> " +
                        "<td> " + response.data[i].author + " </td> " +
                        "<td> " + response.data[i].isbn + " </td> " +
                        "<td> " + response.data[i].printYear + " </td> " +
                        "<td> " + response.data[i].readAlready + " </td> " +

                        "<td><a href='#' onclick= read(" + i + ");>Read<span class=\"glyphicon glyphicon-ok\"></span></a> " +
                        "<td><a href='#' onclick= edit(" + i + ");><span class=\"glyphicon glyphicon-pencil\"></span></a>" +
                        " <td><a href='#' onclick='delete_(" + response.data[i].id + ");'><span class=\"glyphicon glyphicon-trash\"></span></a></td></tr>");
                }
                $("#MainTable").append("</tbody>")
                $('#MainTable').removeAttr('hidden');
                $('#MainTable').DataTable({
                    destroy: true
                });
            },
            error: function () {
                showModal('Error during loading data','An error has occurred!');
            }
        });
    }

    clean = function () {
        $("#id").val('');
        $("#title").val('');
        $("#description").val('');
        $("#author").val('');
        $("#isbn").val('');
        $("#printYear").val('');
        $("#readAlready")[0].checked = false;

        $('#btn_save').attr('disabled', 'disabled');
    }

    showModal = function (header, message) {
        $('#modalHeader').text(header);
        $('#modalPage').text(message);
        $('#myModal').modal('show');
    }

    showDetails = function (header) {
        $('#detailsHeader').text(header);
        $('#details').modal('show');
    }

    showCreateDialog = function () {
        clean();
        $('#detailsHeader').text('Create');
        $('#details').modal('show');
    }

</script>
</body>
</html>
