package dto;

/**
 * 用于接收app/index.jsp页面中查询的参数
 */
public class AppInfoDto {

    private Long devId;
    private String softwareName;
    private Long status;
    private Long flatformId;
    private Long Level1Id;
    private Long Level2Id;
    private Long Level3Id;
    private Integer pageNum;
    private Integer pageSize;
    //table自带的分页、排序数据
    private Integer page;
    private Integer limit;
    private String field;
    private String order;

    public Long getDevId() {
        return devId;
    }

    public void setDevId(Long devId) {
        this.devId = devId;
    }

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getFlatformId() {
        return flatformId;
    }

    public void setFlatformId(Long flatformId) {
        this.flatformId = flatformId;
    }

    public Long getLevel1Id() {
        return Level1Id;
    }

    public void setLevel1Id(Long level1Id) {
        Level1Id = level1Id;
    }

    public Long getLevel2Id() {
        return Level2Id;
    }

    public void setLevel2Id(Long level2Id) {
        Level2Id = level2Id;
    }

    public Long getLevel3Id() {
        return Level3Id;
    }

    public void setLevel3Id(Long level3Id) {
        Level3Id = level3Id;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
