<div class="layui-form" lay-filter="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-inline">
      <script type="text/html" template>
        <input type="text" name="username" value="{{ d.params.username || '' }}" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
      </script>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">手机号码</label>
    <div class="layui-input-inline">
      <script type="text/html" template>
        <input type="text" name="phone" value="{{ d.params.phone || '' }}" lay-verify="phone" placeholder="请输入号码" autocomplete="off" class="layui-input">
      </script>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">邮箱</label>
    <div class="layui-input-inline">
      <script type="text/html" template>
        <input type="text" name="email" value="{{ d.params.email || '' }}" lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
      </script>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label"></label>
    <div class="layui-input-inline">
      <input type="button" lay-submit lay-filter="LAY-user-front-submit" value="确认" class="layui-btn">
    </div>
  </div>
</div>


