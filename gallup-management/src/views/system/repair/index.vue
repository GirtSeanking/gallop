<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="车辆名称" prop="carId">
        <el-select
                v-model="queryParams.carId"
                placeholder="车辆选择"
                clearable
                filterable
              >
                <el-option v-for="item in carInfoList" :key="item.carId" :label="item.carName" :value="item.carId"></el-option>
              </el-select>
      </el-form-item>
      <el-form-item label="品牌名称" prop="brandId">
        <el-select
            v-model="queryParams.brandId"
            placeholder="品牌名称"
            clearable
            filterable>
            <el-option v-for="item in brandInfoList" :key="item.brandId" :label="item.brandName" :value="item.brandId"></el-option>
          </el-select>
      </el-form-item>
      <el-form-item label="维修状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择维修状态" clearable>
          <el-option
            v-for="dict in dict.type.repair_status"
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
          v-hasPermi="['system:repair:add']"
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
          v-hasPermi="['system:repair:edit']"
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
          v-hasPermi="['system:repair:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:repair:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="repairList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="维修记录编号" align="center" prop="repairId" />
      <el-table-column label="车辆名称" align="center" prop="carInfo.carName" />
      <el-table-column label="车型" align="center" prop="carInfo.carType.carTypeName"  />
      <el-table-column label="品牌" align="center" prop="carInfo.brand.brandName" />
      <el-table-column label="所属门店" align="center" prop="carInfo.dept.deptName" />
      <el-table-column label="维修内容" align="center" prop="repairContent" />
      <el-table-column label="维修状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.repair_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180"></el-table-column>
      <el-table-column label="修改时间" align="center" prop="updateTime" width="180"></el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:repair:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:repair:remove']"
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

    <!-- 添加或修改维修信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="车辆选择" prop="carId">
          <el-select
                v-model="form.carId"
                placeholder="车辆选择"
                clearable
                filterable
              >
                <el-option v-for="item in carInfoAvailableList" :key="item.carId" :label="item.carName" :value="item.carId"></el-option>
              </el-select>
        </el-form-item>
        <el-form-item label="维修内容" prop="repairContent">
          <el-input v-model="form.repairContent" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="维修状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择维修状态">
            <el-option
              v-for="dict in dict.type.repair_status"
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
  </div>
</template>

<script>
import { listRepair, getRepair, delRepair, addRepair, updateRepair } from "@/api/system/repair";
import { listCarInfo } from "@/api/system/carInfo";
import { getUserProfile } from "@/api/system/user";
import { listAllCarType } from '@/api/system/carType';
import { listAllBrand } from '@/api/system/brand';
import { deptTreeSelect } from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Repair",
  dicts: ['repair_status'],
  components: { Treeselect },
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
      // 维修信息表格数据
      repairList: [],
      // 弹出层标题
      title: "",
      // 车辆信息表格数据(全)
      carInfoList: [],
      // 车辆信息表格数据(可用车辆)
      carInfoAvailableList: [],
      // 车辆品牌信息表数据
      brandInfoList: [],
      // 车辆车型信息表数据
      carTypeList: [],
      // 部门树显示
      deptShow: false,
      // 部门树选项
      deptOptions: undefined,
      // 部门名称
      deptName: undefined,
      user: {},
      roleGroup: {},
      postGroup: {},
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        carId: null,
        brandId: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        carId: [
          { required: true, message: "车辆编号不能为空", trigger: "blur" }
        ],
        repairContent: [
          { required: true, message: "维修内容不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "维修状态不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getUser();
    this.getList();
    this.getCarInfoList();
    this.getBrandList();
    this.getCarTypeList();
  },
  methods: {
    getUser() {
      getUserProfile().then(response => {
        this.user = response.data;
        this.roleGroup = response.roleGroup;
        this.postGroup = response.postGroup;
        this.user.roles.forEach(element => {
          if (element.roleId === 100 || element.roleId === 1) {
            this.deptShow = true;
            this.getDeptTree();
          }
        });
      });
    },
    /** 查询维修信息列表 */
    getList() {
      this.loading = true;
      listRepair(this.queryParams).then(response => {
        this.repairList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询车辆信息列表 */
    getCarInfoList() {
      this.loading = true;
      listCarInfo().then(response => {
        this.carInfoList = response.rows;
        this.loading = false;
      });
      listCarInfo({status: "0"}).then(res => {
        this.carInfoAvailableList = res.rows;
      })
    },
    /** 查询车辆品牌信息列表 */
    getBrandList() {
      this.loading = true;
      listAllBrand().then(response => {
        this.brandInfoList = response.data;
        this.loading = false;
      })
    },
    /** 查询车辆车型信息列表 */
    getCarTypeList() {
      this.loading = true;
      listAllCarType().then(response => {
        this.carTypeList = response.data;
        this.loading = false;
      })
    },
    /** 查询部门下拉树结构 */
    getDeptTree() {
      deptTreeSelect().then(response => {
        this.deptOptions = response.data;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        repairId: null,
        carId: null,
        repairContent: null,
        status: "1",
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
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
      this.ids = selection.map(item => item.repairId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加维修信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const repairId = row.repairId || this.ids
      getRepair(repairId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改维修信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.repairId != null) {
            updateRepair(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRepair(this.form).then(response => {
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
      const repairIds = row.repairId || this.ids;
      this.$modal.confirm('是否确认删除维修信息编号为"' + repairIds + '"的数据项？').then(function() {
        return delRepair(repairIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/repair/export', {
        ...this.queryParams
      }, `repair_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
