module ActiveRecord
  module ConnectionAdapters
    module SQLServer
      module Type
        class Varchar < Char

          def initialize(*args)
            super
            @limit = 8000 if @limit.to_i == 0
          end

          def type
            :varchar
          end

          def sqlserver_type
            'varchar'.tap do |type|
              type << "(#{limit})" if limit
            end
          end

          def quoted(value)
            return value.quoted_id if value.respond_to?(:quoted_id)
            Utils.quote_string_single(value)
          end
        end
      end
    end
  end
end
