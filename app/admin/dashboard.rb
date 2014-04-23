ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
    
  sidebar("Recent 5 Questions:") do
    ul do
      Quize.limit(5).order('created_at desc').collect do |q|
        li link_to(q.question, "#")
      end
    end
  end

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    section("Total vote number:") do
      h3 Quize.all.count
    end
    
    section("Total question number:") do
      h3 Quize.all.count
    end 
  end


end
