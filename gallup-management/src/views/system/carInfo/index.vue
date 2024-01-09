<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--部门数据-->
      <el-col :span="4" :xs="24" v-show="deptShow">
        <div class="head-container">
          <el-input
            v-model="deptName"
            placeholder="请输入部门名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="deptOptions"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            node-key="id"
            default-expand-all
            highlight-current
            @node-click="handleNodeClick"
          />
        </div>
      </el-col>
      <!--车辆数据-->
      <el-col :span="deptShow ? 20 : 24" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="车辆名称" prop="carName">
        <el-input
          v-model="queryParams.carName"
          placeholder="请输入车辆名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="品牌名称" prop="brandId">
        <el-select
          v-model="queryParams.brandId"
          placeholder="品牌名称"
          clearable
          filterable
          style="width: 240px"
        >
          <el-option v-for="item in brandInfoList" :key="item.brandId" :label="item.brandName" :value="item.brandId"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="车型名称" prop="carTypeId">
        <el-select
          v-model="queryParams.carTypeId"
          placeholder="车型名称"
          clearable
          filterable
          style="width: 240px"
        >
          <el-option v-for="item in carTypeList" :key="item.carTypeId" :label="item.carTypeName" :value="item.carTypeId"></el-option>
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
          v-hasPermi="['system:carInfo:add']"
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
          v-hasPermi="['system:carInfo:edit']"
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
          v-hasPermi="['system:carInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:carInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="carInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="车辆信息编号" align="center" prop="carId" />
      <el-table-column label="车辆品牌" align="center" prop="brandId">
        <template slot-scope="scope">
          <div>{{ scope.row.brand.brandName }}</div>
        </template>
      </el-table-column>
      <el-table-column label="车辆车型" align="center" prop="carTypeId">
        <template slot-scope="scope">
          <div>{{ scope.row.carType.carTypeName }}</div>
        </template>
      </el-table-column>
      <el-table-column label="车辆名称" align="center" prop="carName" />
      <el-table-column label="所属门店" align="center" prop="dept.deptName">
        <template slot-scope="scope">
          <div>{{ deptShow ? scope.row.dept.deptName :  user.dept.deptName}}</div>
        </template>
      </el-table-column>
      <el-table-column label="车辆简介" align="center" prop="carDes" />
      <el-table-column label="车辆图片" align="center" prop="carImgs" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.carImgs" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="车辆租金" align="center" prop="rent">
        <template slot-scope="scope">
          <span>{{ scope.row.rent }}元/日</span>
        </template>
      </el-table-column>
      <el-table-column label="车辆状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_car_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:carInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:carInfo:remove']"
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
      </el-col>
    </el-row>
    

    <!-- 添加或修改车辆信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="车辆名称" prop="carName">
              <el-input v-model="form.carName" placeholder="请输入车辆名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属门店" prop="deptId">
              <treeselect v-if="deptShow" v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属门店" />
              <div v-if="!deptShow">{{ user.dept.deptName }}</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="品牌名称" prop="brandId">
              <el-select
                v-model="form.brandId"
                placeholder="品牌名称"
                clearable
                filterable
              >
                <el-option v-for="item in brandInfoList" :key="item.brandId" :label="item.brandName" :value="item.brandId"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="车型名称" prop="carTypeId">
              <el-select
                v-model="form.carTypeId"
                placeholder="车型名称"
                clearable
                filterable
              >
                <el-option v-for="item in carTypeList" :key="item.carTypeId" :label="item.carTypeName" :value="item.carTypeId"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="车辆简介" prop="carDes">
          <el-input v-model="form.carDes" placeholder="请输入车辆简介" />
        </el-form-item>
        <el-form-item label="车辆图片" prop="carImgs">
          <image-upload v-model="form.carImgs"/>
        </el-form-item>
        <el-form-item label="车辆租金" prop="rent">
          <el-input v-model="form.rent" placeholder="请输入车辆租金">
            <template slot="append">元/日</template>
          </el-input>
        </el-form-item>
        <el-form-item label="车辆状态" prop="status">
          <el-select
            v-model="form.status"
            placeholder="车辆状态"
          >
            <el-option v-for="dict in dict.type.sys_car_status" :key="dict.value" :label="dict.label" :value="dict.value"></el-option>
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
import { listCarInfo, getCarInfo, delCarInfo, addCarInfo, updateCarInfo } from "@/api/system/carInfo";
import { getUserProfile } from "@/api/system/user";
import { listAllCarType } from '@/api/system/carType';
import { listAllBrand } from '@/api/system/brand';
import { deptTreeSelect } from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "CarInfo",
  dicts: ['sys_car_status'],
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
      // 车辆信息表格数据
      carInfoList: [],
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
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        carName: null,
        brandId: null,
        carTypeId: null,
        deptId: null,
      },
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label"
      },
      // 表单校验
      rules: {
        brandId: [
          { required: true, message: "车辆品牌编号不能为空", trigger: "change" }
        ],
        carTypeId: [
          { required: true, message: "车辆车型编号不能为空", trigger: "change" }
        ],
        carName: [
          { required: true, message: "车辆名称不能为空", trigger: "blur" }
        ],
        rent: [
          { required: true, message: "租金不能为空", trigger: "blur" },
          { pattern: /^[0-9]+(\.[0-9]{1,2})?$/, message: "请输入正确的租金", trigger: "blur" }
        ],
        status: [
          { required: true, message: "车辆状态不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getUser();
    this.getList();
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
    /** 查询车辆信息列表 */
    getList() {
      this.loading = true;
      listCarInfo(this.queryParams).then(response => {
        this.carInfoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.deptId = data.id;
      this.handleQuery();
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        carId: null,
        brandId: null,
        carTypeId: null,
        deptId: null,
        carName: null,
        carDes: null,
        carImgs: null,
        rent: null,
        status: "0",
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
      this.ids = selection.map(item => item.carId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加车辆信息";
      if (!this.deptShow) {
        this.form.deptId = this.user.dept.deptId;
      }
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const carId = row.carId || this.ids
      if (!this.deptShow) {
        this.form.deptId = this.user.dept.deptId;
      }
      getCarInfo(carId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改车辆信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.carId != null) {
            updateCarInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCarInfo(this.form).then(response => {
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
      const carIds = row.carId || this.ids;
      this.$modal.confirm('是否确认删除车辆信息编号为"' + carIds + '"的数据项？').then(function() {
        return delCarInfo(carIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/carInfo/export', {
        ...this.queryParams
      }, `carInfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
