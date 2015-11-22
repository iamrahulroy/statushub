class UserPdf < Prawn::Document
  def initialize(user, view)
    super(top_margin: 70)
    @user = user
    @view = view
    user_details
  end

  def user_details
    user_text = "User status: #{@user.status}\n" +
                "User weight: #{weight} KG\n" +
                "User height: #{@user.height} cm\n" +
                "User is vegan?: #{is_vegan?}\n" +
                "User drinks?: #{drinks?}\n" +
                "User date of birth: #{@user.dob.to_formatted_s(:long_ordinal)}\n" +
                "User ethnicity: #{@user.category.try(:name)}"
    text user_text
  end

  def weight
    @user.weight / 1000
  end

  def is_vegan?
    @user.is_veg ? 'Yes' : 'No'
  end

  def drinks?
    @user.drink ? 'Yes' : 'No'
  end
end


