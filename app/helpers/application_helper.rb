#encoding: utf-8
module ApplicationHelper
  def full_title(page_title)
    base_title = "变电检修中心车辆管理系统"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
