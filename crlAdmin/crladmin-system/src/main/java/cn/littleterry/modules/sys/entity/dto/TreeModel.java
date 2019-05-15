package cn.littleterry.modules.sys.entity.dto;

import lombok.Data;

import java.util.List;

/**
 * @author tengxing
 * @since 09/05/2019
 */
@Data
public class TreeModel {
    private Integer id;
    private String label;
    private List<TreeModel> children;
}
