<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container" style="margin-top: 100px">
    <div class="row gx-lg-5 gx-md-4 gx-2 justify-content-center">
        <div class="col-12 col-md-10 col-lg-4 card p-3 p-md-5 p-lg-5 pt-4">
            <div class="mb-3">
                <h4 class="form-title text-center fs-4 text-dark">Kiểm Tra Đơn
                    Hàng</h4>
            </div>

            <form action="/webfood/chi-tiet-don-hang" method="get">
                <div class="mb-5">
                    <input type="text" class="form-control p-2" id="order_code"
                        aria-describedby="emailHelp" name="order_code" required
                        placeholder="Nhập mã đơn hàng">
                    <span class="form-message text-danger"></span>
                </div>
                <div class="mb-3 d-flex justify-content-center">
                    <button type="submit" class="btn btn-danger w-100">Kiểm
                        tra</button>
                </div>
            </form>
        </div>
    </div>
</div>
