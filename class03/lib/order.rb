class Order
    attr_reader :products
    def initialize(file_path = nil)
        @products = []
        @products = YAML::load_file file_path if file_path
    end
    def filter_by_category(category)
        products.select {|p| p.category == category}
    end
    def add_product(new_product)
        products.push new_product
        # NOTE: Yes, something's wrong. I can feel it too...
        products.last
    end
    def filter_by_price(lowest_price, highest_price)
        products.select {|p| lowest_price <= p.price and p.price <= highest_price}
    end
    def save(path)
        File::open path, 'w' do |f|
            YAML::dump self, f
        end
    end
    def ==(comparee)
        self.products.to_s == comparee.products.to_s
    end
end
