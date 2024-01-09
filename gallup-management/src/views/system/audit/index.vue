<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户审核名字" prop="userAuditName">
        <el-input
          v-model="queryParams.userAuditName"
          placeholder="请输入用户审核名字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户审核状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择用户审核状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_user_audit_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:audit:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:audit:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:audit:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:audit:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="auditList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户审核表编号" align="center" prop="userAuditId" />
      <el-table-column label="用户昵称" align="center" prop="user.nickName" />
      <el-table-column label="用户账户" align="center" prop="user.userName" />
      <el-table-column label="用户身份证号" align="center" prop="userIdCard" />
      <el-table-column label="用户审核名字" align="center" prop="userAuditName" />
      <el-table-column label="用户身份证照片信息" align="center" prop="idCardImgs" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.idCardImgs" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="驳回理由" align="center" prop="rejectReason" />
      <el-table-column label="用户审核状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_audit_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-release"
            v-if="scope.row.status === '1'"
            @click="handleAudit(scope.row)"
          >审核</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:audit:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:audit:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改用户认证审核对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户编号" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户编号" />
        </el-form-item>
        <el-form-item label="用户身份证号" prop="userIdCard">
          <el-input v-model="form.userIdCard" placeholder="请输入用户身份证号" />
        </el-form-item>
        <el-form-item label="用户审核名字" prop="userAuditName">
          <el-input v-model="form.userAuditName" placeholder="请输入用户审核名字" />
        </el-form-item>
        <el-form-item label="用户身份证照片信息" prop="idCardImgs">
          <image-upload v-model="form.idCardImgs"/>
        </el-form-item>
        <el-form-item label="驳回理由" prop="rejectReason">
          <el-input v-model="form.rejectReason" placeholder="请输入驳回理由" />
        </el-form-item>
        <el-form-item label="用户审核状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择用户审核状态">
            <el-option
              v-for="dict in dict.type.sys_user_audit_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 用户审核弹窗 -->
    <el-dialog title="用户审核" :visible.sync="auditOpen" width="600px" append-to-body>
      <el-form ref="auditForm" :model="auditForm" :rules="auditRules" label-width="80">
        <el-form-item label="用户身份证号" prop="userIdCard">
          <span>{{ auditForm.userIdCard }}</span>
        </el-form-item>
        <el-form-item label="用户审核名字" prop="userAuditName">
          <span>{{ auditForm.userAuditName }}</span>
        </el-form-item>
        <el-form-item label="用户身份证照片信息" prop="idCardImgs">
          <el-image v-for="imgSrc in imgList" :src="convertImgSrc(imgSrc)" style="width: 100px;height: 100px;margin-right: 10px;margin-bottom: 10px;" :preview-src-list="convertImgSrcPreviewList(imgSrc)"/>
        </el-form-item>
        <el-form-item label="驳回理由" prop="rejectReason">
          <el-input v-model="auditForm.rejectReason" type="textarea" placeholder="请输入驳回理由" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="success" @click="submitAuditForm">通 过</el-button>
        <el-button type="danger" @click="rejectAuditForm">驳 回</el-button>
        <el-button @click="cancelAudit">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAudit, getAudit, delAudit, addAudit, updateAudit } from "@/api/system/audit";

export default {
  name: "Audit",
  dicts: ['sys_user_audit_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户认证审核表格数据
      auditList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 用户审核弹窗
      auditOpen: false,
      // 用户审核图片
      imgList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userAuditName: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 审核表单参数
      auditForm: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户编号不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "用户审核状态不能为空", trigger: "change" }
        ],
      },
      // 审核表单校验
      auditRules: {
        rejectReason: [
          { required: true, message: "驳回理由不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户认证审核列表 */
    getList() {
      this.loading = true;
      listAudit(this.queryParams).then(response => {
        this.auditList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 审核取消按钮
    cancelAudit() {
      this.auditOpen = false;
    },
    // 表单重置
    reset() {
      this.form = {
        userAuditId: null,
        userId: null,
        userIdCard: null,
        userAuditName: null,
        idCardImgs: null,
        rejectReason: null,
        status: "0",
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    // 审核表单重置
    resetAuditForm(row) {
      this.auditForm = {
        userAuditId: row.userAuditId,
        userId: row.userId,
        userIdCard: row.userIdCard,
        userAuditName: row.userAuditName,
        idCardImgs: row.idCardImgs,
        rejectReason: row.rejectReason,
        status: row.status,
      }
      if (this.auditForm.idCardImgs != null) {
        this.imgList = this.auditForm.idCardImgs.split(",");
      }
      this.resetForm("auditForm");
    },
    convertImgSrc(realSrc) {
      return process.env.VUE_APP_BASE_API + realSrc;
    },
    convertImgSrcPreviewList(realSrc) {
      let srcList = [];
      srcList.push(this.convertImgSrc(realSrc));
      return srcList;
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.userAuditId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户认证审核";
    },
    /** 审核按钮操作 */
    handleAudit(row) {
      this.resetAuditForm(row);
      this.auditOpen = true;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const userAuditId = row.userAuditId || this.ids
      getAudit(userAuditId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改用户认证审核";
      });
    },
    // 提交审核按钮
    submitAuditForm() {
      this.auditForm.status = '3';
      this.handleAuditSubmit();
    },
    // 驳回审核按钮
    rejectAuditForm() {
      this.$refs['auditForm'].validate(valid => {
        if (valid) {
          this.auditForm.status = '2';
          this.handleAuditSubmit();
        }
      });
    },
    // 审核结果提交
    handleAuditSubmit() {
      if (this.auditForm.userAuditId != null) {
        updateAudit(this.auditForm).then(resp => {
          this.$modal.msgSuccess("审核完成");
          this.auditOpen = false;
          this.getList();
        }
      );
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.userAuditId != null) {
            updateAudit(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAudit(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const userAuditIds = row.userAuditId || this.ids;
      this.$modal.confirm('是否确认删除用户认证审核编号为"' + userAuditIds + '"的数据项？').then(function() {
        return delAudit(userAuditIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/audit/export', {
        ...this.queryParams
      }, `audit_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
