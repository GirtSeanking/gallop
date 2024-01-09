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
      <!--订单数据-->
      <el-col :span="deptShow ? 20 : 24" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="108px">
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
      <el-form-item label="车型" prop="carTypeId">
        <el-select
            v-model="queryParams.carTypeId"
            placeholder="车型"
            clearable
            filterable
            >
            <el-option v-for="item in carTypeList" :key="item.carTypeId" :label="item.carTypeName" :value="item.carTypeId"></el-option>
          </el-select>
      </el-form-item>
      <el-form-item label="订单支付状态 " prop="payStatus">
        <el-select v-model="queryParams.payStatus" placeholder="请选择订单支付状态 " clearable>
          <el-option
            v-for="dict in dict.type.sys_order_pay_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="订单状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择订单状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_order_status"
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
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['system:order:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:order:edit']"
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
          v-hasPermi="['system:order:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:order:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单编号" align="center" prop="orderId" />
      <el-table-column label="车辆名称" align="center" prop="carInfo.carName" />
      <el-table-column label="车辆图片" align="center" prop="carInfo.carImg" width="100">
        <template slot-scope="scope">
          <image-preview  :src="scope.row.carInfo.carImgs" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="车辆品牌" align="center" prop="brand.brandName" />
      <el-table-column label="车辆车型" align="center" prop="carType.carTypeName" />
      <el-table-column label="受理门店" align="center" prop="dept.deptName" />
      <el-table-column label="出租天数" align="center" prop="rentalDay" />
      <el-table-column label="订单截止日期" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="每日价格" align="center" prop="priceDay" />
      <el-table-column label="租金总价" align="center" prop="priceTotal" />
      <el-table-column label="订单支付状态 " align="center" prop="payStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_order_pay_status" :value="scope.row.payStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="订单状态" align="center" prop="status" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_order_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:order:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:order:remove']"
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


    <!-- 添加或修改订单信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="车辆选择" prop="carId">
          <el-select
                v-model="form.carId"
                placeholder="车辆选择"
                clearable
                filterable
                @change="handleCarChange"
              >
                <el-option v-for="item in carInfoAvailableList" :key="item.carId" :label="item.carName" :value="item.carId"></el-option>
              </el-select>
        </el-form-item>
        <el-form-item label="车辆品牌" prop="brandId">
          <el-select
            v-model="form.brandId"
            placeholder="品牌名称"
            filterable
            disabled>
            <el-option v-for="item in brandInfoList" :key="item.brandId" :label="item.brandName" :value="item.brandId"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="车辆车型" prop="carTypeId">
          <el-select
            v-model="form.carTypeId"
            placeholder="车型名称"
            filterable
            disabled
            >
            <el-option v-for="item in carTypeList" :key="item.carTypeId" :label="item.carTypeName" :value="item.carTypeId"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="受理门店" prop="deptId">
          <treeselect disabled v-if="deptShow" v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="受理门店" />
        </el-form-item>
        <el-form-item label="出租天数" prop="rentalDay">
          <el-input v-model="form.rentalDay" placeholder="请输入出租天数" type="number" @change="handlePriceTotalChange" />
        </el-form-item>
        <el-form-item label="订单截止日期" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择订单截止日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="每日价格" prop="priceDay">
          <el-input v-model="form.priceDay" placeholder="请输入每日价格" @change="handlePriceTotalChange" />
        </el-form-item>
        <el-form-item label="租金总价" prop="priceTotal">
          <el-input v-model="form.priceTotal" placeholder="请输入租金总价" disabled />
        </el-form-item>
        <el-form-item label="订单支付状态 " prop="payStatus">
          <el-select v-model="form.payStatus" placeholder="请选择订单支付状态 ">
            <el-option
              v-for="dict in dict.type.sys_order_pay_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="订单状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择订单状态">
            <el-option
              v-for="dict in dict.type.sys_order_status"
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
import { listOrder, getOrder, delOrder, addOrder, updateOrder } from "@/api/system/order";
import { listCarInfo } from "@/api/system/carInfo";
import { getUserProfile } from "@/api/system/user";
import { listAllCarType } from '@/api/system/carType';
import { listAllBrand } from '@/api/system/brand';
import { deptTreeSelect } from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Order",
  dicts: ['sys_order_status', 'sys_order_pay_status'],
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
      // 订单信息表格数据
      orderList: [],
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
        carTypeId: null,
        deptId: null,
        payStatus: null,
        status: null,
      },
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label"
      },
      // 表单校验
      rules: {
        carId: [
          { required: true, message: "车辆编号不能为空", trigger: "blur" }
        ],
        brandId: [
          { required: true, message: "品牌编号不能为空", trigger: "blur" }
        ],
        carTypeId: [
          { required: true, message: "车型编号不能为空", trigger: "blur" }
        ],
        deptId: [
          { required: true, message: "门店编号不能为空", trigger: "blur" }
        ],
        rentalDay: [
          { required: true, message: "出租天数不能为空", trigger: "blur" }
        ],
        endTime: [
          { required: true, message: "订单截止日期不能为空", trigger: "blur" }
        ],
        priceDay: [
          { required: true, message: "每日价格不能为空", trigger: "blur" },
          { pattern: /^[0-9]+(\.[0-9]{1,2})?$/, message: "请输入正确的价格", trigger: "blur" }
        ],
        priceTotal: [
          { required: true, message: "租金总价不能为空", trigger: "blur" },
        ],
        payStatus: [
          { required: true, message: "订单支付状态 不能为空", trigger: "change" }
        ],
        status: [
          { required: true, message: "订单状态不能为空", trigger: "change" }
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
    /** 查询订单信息列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询车辆信息列表 */
    getCarInfoList() {
      this.loading = true;
      listCarInfo({}).then(response => {
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
    // 车辆选择
    handleCarChange(value) {
      if (value != null || value != '') {
        this.carInfoList.forEach(item => {
          if (item.carId == value) {
            this.form.brandId = item.brandId;
            this.form.carTypeId = item.carTypeId;
            this.form.deptId = item.deptId;
            this.form.priceDay = item.rent;
          }
        })
      }
      this.handlePriceTotalChange();
    },
    // 计算租金总价
    handlePriceTotalChange() {
      this.form.priceTotal = this.form.priceDay * this.form.rentalDay;
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
        orderId: null,
        carId: null,
        brandId: null,
        carTypeId: null,
        deptId: null,
        rentalDay: 1,
        endTime: null,
        priceDay: 0,
        priceTotal: 0,
        payStatus: "0",
        status: "3",
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
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const orderId = row.orderId || this.ids
      getOrder(orderId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.orderId != null) {
            updateOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
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
      const orderIds = row.orderId || this.ids;
      this.$modal.confirm('是否确认删除订单信息编号为"' + orderIds + '"的数据项？').then(function() {
        return delOrder(orderIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
